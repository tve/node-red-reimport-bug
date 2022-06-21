
module.exports = function (RED) {

  console.log("test node loaded")

  function test(n) {
    RED.nodes.createNode(this, n)

    var node = this

    node.on("input", function(msg,send,done){
      send = send || function() { node.send.apply(node,arguments) } 
      send(msg);
      done()
    })
  }

  RED.nodes.registerType("test", test)
} 
