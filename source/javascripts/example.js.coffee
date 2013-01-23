$(document).ready ->
  sigRoot = document.getElementById('sigma-example')
  sigInst = sigma.init(sigRoot)
  nodeCount = 0
  window.debugSigInst = sigInst
  
  #### Drawing properties

  sigInst.drawingProperties(
    defaultLabelColor: '#fff',
    defaultLabelSize: 14,
    defaultLabelBGColor: '#fff',
    defaultLabelHoverColor: '#000',
    labelThreshold: 6,
    defaultEdgeType: 'curve'
  ).graphProperties(
    minNodeSize: 5,
    maxNodeSize: 5,
    minEdgeSize: 1,
    maxEdgeSize: 1
  ).mouseProperties(
    maxRatio: 4
  )

  #### Helpers

  addNode = (label, color) ->
    sigInst.addNode nodeCount, label, color
    nodeCount++

  addEdge = (relationName, node1, node2) ->
    sigInst.addEdge(relationName, node1, node2).draw()

  $('#addNode').click ->
    addNode $('#nodeLabel'), '#aaa'
    for nodeRelation in [0..nodeCount-1]
      addEdge "#{nodeRelation}_#{nodeCount-1}", "#{nodeRelation}", "#{nodeCount-1}"
    

  ##### Make some sample data

  addNode "0", "#fff"
  for node in [1..100]
    addNode "#{node}", "#fff"

    # Mix a little
    for nodeRelation in [0..node]
      addEdge "#{nodeRelation}_#{node}", "#{nodeRelation}", "#{node}"
