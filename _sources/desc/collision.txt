desc.collision
==============
.. toctree::
    :glob:

.. py:function:: desc.collision.addCompositeMesh(collision_scene, name, **kwargs)

    Adds a composite mesh to a collision scene.
    See fillCompositeMesh for a description of the parameters.

    :return: the created description

.. py:function:: desc.collision.appendLabelToMeshReferences(node, append_label)

    Appends a string label to the references to the meshes.

    :param node: is the root of the subtree.
    :param append_label: is a string.

.. py:function:: desc.collision.cleanMeshes(source_library, mesh_names, remove_duplicated_vertex=True, remove_duplicated_triangles=True, remove_flat_triangles=True, remove_zero_length_edges=True, remove_isolated_vertex=False)

    Cleans mesh descriptions and return new, clean meshes in a library. The
    clean meshes have the same name as the original meshes.

    :param meshes: is a list of mesh descriptions to clean (for instance, all meshes of a library.
    :param remove_duplicated_vertex: [default: True] is a boolean.
    :param remove_duplicated_triangles: [default: True] is a boolean.
    :param remove_flat_triangles: [default: True] is a boolean.
    :param remove_zero_length_edges: [default: True] is a boolean.
    :param remove_isolated_vertex: [default: False] is a boolean.
    :return: a new library containing all the clean meshes.

.. py:function:: desc.collision.copyFromGraphicalTree(composite_node, src_graph_node)

    Create a composite tree from a graphical subtree.

    :param composite_node: is the root of the tree to initialize.
    :param src_graph_node: is the root of the source graphical tree.

.. py:function:: desc.collision.fillCompositeMesh(composite_mesh, composite_name, offset=0.0, persistence_path='', env=False, grid_resolution=0.5)

    Initialization of a composite mesh.

    :param composite_name: is the name of the composite to add to the collision scene. If None, the name of the source GraphNode is used.
    :param offset: [default: 0.] is the offset of the composite.
    :param persistence_path: is the path to a persistence file. If not empty string, offset is ignored.
	:param env: [default: False] can be set to True to activate the 'env' flag for the XCD engine.
	:param grid_resolution: [default: .5] grid resolution for the env flag.
    :return: the created and added collision_pb2.CompositeMesh message.

.. py:function:: desc.collision.fillCompositeNode(composite_node, name, position=None, scale=None, mesh_refs=None)

.. py:function:: desc.collision.getMeshRefsFromCompositeTree(library, node)

    Returns the names of the meshes referenced in a composite tree. If the library contains several meshes with the same name, the last one is used.

    :param library: is the library where the meshes used in the tree are stored.
    :param node: is a composite node, for instance it can be the root_node of a composite mesh.
    :return: a pair (found,not_found) where found is the set of found meshes and not_found is the set of mesh names that were not found in the library (if any).

.. py:function:: desc.collision.getMeshesFromCompositeTree(library, node)

.. py:function:: desc.collision.setNodePosition(node, H)

   Sets the position field of a node.

   :param node: is a collision or graph node.
   :param H: is an lgsm displacement.

.. py:function:: desc.collision.setNodeScale(node, scale)

   Changes the scale of a node. An isometric scale can be specified, or a list of three scales.

   :param scale: is either a float, int or long, or a list of three ints, floats or longs.

.. py:function:: desc.collision.updateCompositeMeshReferences(composite_node, mapping)

    Updates the references to meshes in a composite tree using a specified mapping that associates new names to the original ones. Any reference to a mesh whose name is not in the mapping will be untouched.

    :param composite_node: is the root of the composite tree or subtree to process.
	:param mapping: is a dictionnary old_name (string)->new_name  (string).
    :return: None

