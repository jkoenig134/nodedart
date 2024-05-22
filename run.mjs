import fs from "node:fs/promises"
import { instantiate, invoke } from "./lib/dart_wasm_node.mjs"

const wasmBuffer = await fs.readFile("./lib/dart_wasm_node.wasm")
const wasmModule = await WebAssembly.compile(wasmBuffer)
const instance = await instantiate(wasmModule)

invoke(instance, "Hello from js")

global.onDartMessage = (msg) => {
  console.log(msg)
  onJSMessage("Hello from js")
}
