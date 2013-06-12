desc.core
=========
.. toctree::
    :glob:

.. py:function:: desc.core.absolutePositions(root, H=<Displacement x,y,z,qw,qx,qy,qz = (0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0)>, scale=[1, 1, 1], get_node_name=<function <lambda>>, get_node_pos=<function <lambda>>, get_node_scale=<function <lambda>>)

   Returns a dictionary of nodes' absolute positions.
   The keys of the dictionary are the node names, and the values are the absolute positions (lgsm.Displacements).
   A node is any structure with a member 'name' and an iterable member 'children' whose elements are nodes.
   The member 'name' must be equality-comparable with the argument 'name'
   (e.g. collision_pb2.CompositeNode or graphic_pb2.GraphNode).
   For this function, nodes must have an iterable field 'position',
   whose elements represent a Displacement x,y,z,qw,qx,qy,qz in that order.

   :param root: is the root node of the tree.
   :param H: [default: lgsm.Displacement()] is an additional offset that will be applied on the left of all results.
   :param scale: [default: [1,1,1]] is a scale to apply to the root node.
   :param get_node_name: is a lambda function that extracts the name of a node. By default, it looks for a field "name"  in the node members.
   :param get_node_pos: is a lambda function that extracts the position of a node. By default, it looks for a field "position" in the node members.
   :param get_node_scale: is a lambda function that extracts the scale of a node. By default, it looks for a field "scale" in the node members.
   :return: the dictionary of absolute displacements.

.. py:function:: desc.core.absoluteScales(root, scale=[1, 1, 1], get_node_name=<function <lambda>>, get_node_scale=<function <lambda>>)

    Returns a dictionary of nodes' absolute scales. The keys of the dictionary are
    the node names, and the values are the absolute scales (3-sized lgsm.vectors).
    A node is any structure with a member 'name' and an iterable member 'children'
    whose elements are nodes.  The member 'name' must be equality-comparable with
    the argument 'name'. For this function, nodes must have an iterable field
    'scale', with 3 elements representing the x-scale, y-scale and z-scale.

    :param root: is the root node of the tree.
	:param scale: [default: [1,1,1]] is an additional scale that will be applied to all results.
	:param get_node_name: is a lambda function that extracts the name of a node. By default, it looks for a field "name" in the node members.
	:param get_node_scale: is a lambda function that extracts the scale of a node. By default, it looks for a field "scale" in the node members.
    :return: the dictionary of absolute displacements.

.. py:function:: desc.core.appendLabelToCollection(elements, append_label)

    Appends a string label to the names of the elements of a collection. Works for
    the meshes and materials of a scene_pb2.Lib rary.  The references to these
    elements in any graphical or collision tree *are not changed*! Remember to call
    appendLabelToLibraryReferences if needed.

    :param elements: is a collection of meshes or materials. Works for any iterable of elements with a field "name".
    :param append_label: is a string.

.. py:function:: desc.core.appendLabelToNodes(node, append_label, set_node_name=<function <lambda>>, appender=<function <lambda>>)

    Appends a string label to all nodes name of a tree.

    :param node: is the root of the subtree.
    :param append_label: is a string.
    :param set_node_name: is a lambda function that sets the name of a node (by default it assigns a string to the field "name" of a node.
    :param appender: is a lambda function that returns a new node name given a node and a suffix (by default, it appends the suffix to the value of the field "name" of the node).

.. py:function:: desc.core.copyTree(dest_parent_node, source_node, trim_nodes=[])

    Appends a copy of a tree to a node. This performs a deep copy of the subtree
    (only the nodes themselves, not the referenced items such as meshes or materials).
    A tree node has a field "name" (string) and a field "children" (list of nodes).

    :param dest_parent_node: is the parent node in the destination tree.
	:param source_node: is the root of the subtree to append.
	:param trim_nodes: [default: []] is a list of nodes to remove from the copied tree (the source tree is untouched).
    :return: the node of the attached subtree.

.. py:function:: desc.core.displacementToRepeatedField(H)

.. py:function:: desc.core.findInList(seq, to_find)

    Searches elements with given names in a sequence.
    The elements must have a member 'name' equality-comparable to the one specified in arguments.
    This function will work e.g. to search meshes in a scene_pb2.Library instance, ...

    :param seq: is the sequence in which the element is searched for.
	:param to_find: a list or a set of names of elements to find.
    :return: the list of found elements. If to_find is a string (only one element is sought), returns the element if found, None otherwise.


.. py:function:: desc.core.findInTree(node, to_find, get_node_name=<function <lambda>>)

    Searches nodes with given names in a tree.
    A node is any structure with a member 'name' and an iterable member 'children'
    whose elements are nodes. The member 'name' must be equality-comparable with the argument 'name'.
    This function will work e.g. with graphic_pb2.GraphNode, collision_pb2.CompositeNode...

    :param node: is the root of the (sub)tree.
	:param to_find: a list or a set of names of elements to find.
	:param get_node_name: is a lambda function that extracts the name of a node. By default, it looks for a field "name" in the node members.
    :return: the list of found elements. If to_find is a string (only one element is sought), returns the first element if found, None otherwise.

.. py:function:: desc.core.getNodesFromTree(node)

    Returns all the nodes af a subtree as a list.

.. py:function:: desc.core.printTree(root, get_node_name=<function <lambda>>)

    Prints a tree starting from a given node. A node must have an iterable member 'children' whose elements are nodes.
    This works e.g. with graphic_pb2.GraphNode and collision_pb2.CompositeNode instances.

    :param root: is the root of the tree to display.
	:param get_node_name: is a lambda function that extracts the name of a node. By default, it looks for a field "name" in the node members.

.. py:function:: desc.core.setNodePosition(node, H)

   Sets the position field of a node.

   :param node: is a collision or graph node.
   :param H: is an lgsm displacement.

.. py:function:: desc.core.setNodeScale(node, scale)

   Changes the scale of a node. An isometric scale can be specified, or a list of three scales.

   :param scale: is either a float, int or long, or a list of three ints, floats or longs.

.. py:function:: desc.core.trimNodes(root, trim_nodes, get_node_name=<function <lambda>>)

   Removes nodes from a tree. A node is any structure with an iterable member 'children' whose elements are nodes.

   :param root: is the root of the tree to trim.
   :param trim_nodes: is a list of names of nodes to trim or a lambda function that returns True for all nodes to trim.
   :param get_node_name: is a lambda function that extracts the name of a node. By default, it looks for a field "name" in the node members.

.. py:function:: desc.core.visitBreadthFirst(fn, node)

    Applies fn to the nodes of a tree or subtree by visiting the tree in breadth-first order.

    :param fn: is a function to apply to each node.
    :param node: is the root of the (sub)tree.

.. py:function:: desc.core.visitDepthFirst(fn, node)

    Applies fn to the nodes of a tree or subtree by visiting the tree in depth-first order.

    :param fn: is a function to apply to each node.
    :param node: is the root of the (sub)tree.
