self.importScripts("wasm_exec.js");

self.loaded = false;
load = () => {

  if (!WebAssembly.hasOwnProperty('instantiateStreaming')){
    return loadFallback();
  }

  const go = new Go();
  let mod, inst;
  return WebAssembly.instantiateStreaming(
    fetch("rsa.wasm"),
    go.importObject
  ).then(async (result) => {
    mod = result.module;
    inst = result.instance;
    const run = async () => {
      try {
        self.loaded = true;
        await go.run(inst);
        self.loaded = false;
      } catch (e) {
        console.warn(e);
        self.loaded = false;
        load();
      }
    };
    run();
  });
};

loadFallback = () => {
  const go = new Go();
  let mod, inst;
  return fetch("rsa.wasm").then(response =>
    response.arrayBuffer()
  ).then(bytes =>
    WebAssembly.instantiate(bytes, go.importObject)
  ).then(async (result) => {
    mod = result.module;
    inst = result.instance;
    const run = async () => {
      try {
        self.loaded = true;
        await go.run(inst);
        self.loaded = false;
      } catch (e) {
        console.warn(e);
        self.loaded = false;
        loadFallback();
      }
    };
    run();
  });
};

onmessage = async ({ data }) => {
  if (!self.loaded) {
    await load();
  }

  const { request, name, id } = data;

  try {
    rsaBridgeCall(name, request, request.length, (error, response) => {
      const payload = {
        id,
        response,
        error,
      };

      postMessage(payload);
    });
  } catch (e) {
    self.loaded = false;
    const payload = {
      id,
      response: null,
      error: e.message,
    };

    postMessage(payload);
  }
};
