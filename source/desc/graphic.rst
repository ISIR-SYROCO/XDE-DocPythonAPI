desc.graphic
============
.. toctree::
    :glob:

.. py:function:: desc.graphic.addGraphicalMesh(graphical_node, name, **kwargs)

.. py:function:: desc.graphic.addGraphicalNode(graphical_scene, name=None, source_node=None, parent_node=None, position=None, scale=None)

.. py:function:: desc.graphic.appendLabelToGraphicalMeshes(node, append_label)

    Appends a string label to all graphical mesh names of a tree.

    :param node: is the root of the subtree (graphic_pb2.GraphNode).
    :param append_label: is a string.

.. py:function:: desc.graphic.appendLabelToMaterialReferences(node, append_label)

    Appends a string label to the references to the materials. Works for graphical nodes.

    :param node: is the root of the subtree (graphic_pb2.GraphNode).
    :param append_label: is a string.

.. py:function:: desc.graphic.appendLabelToMeshReferences(node, append_label)

    Appends a string label to the references to the meshes.

    :param node: is the root of the subtree.
    :param append_label: is a string.

.. py:function:: desc.graphic.applyMaterialSet(node, material_set)

    Applies a material set to the nodes of a graphical subtree.
    The meshes will be visited in depth-first order and for each
    mesh will be associated to the current material. When calling
    the function, the current material is set to the first element
    of the material set, and then for each mesh, the next element of
    the material set becomes the current material. When the end of
    the material set is reached, we start over with the first material of the set.

    :param node: is the root of the graphical subtree.
    :param material_set: is a list of materials (strings).

.. py:function:: desc.graphic.copyFromCompositeTree(graph_node, src_composite_node)

    Create a graphical tree from a composite subtree.

    :param src_graph_node: is the root of the tree to initialize.
    :param composite_node: is the root of the source graphical tree.

.. py:function:: desc.graphic.fillGraphicalMesh(graphical_mesh, name, src_graphical_mesh=None, mesh_ref_name=None, material_name=None, lod_factor=None, static_geometry=None)

.. py:function:: desc.graphic.getGraphicalMeshesFromTree(node)

.. py:function:: desc.graphic.getLibraryElementsFromGraphicalTree(library, node)

.. py:function:: desc.graphic.getMaterialRefsFromGraphicalTree(library, node)

    Returns the names of the materials referenced in a graphical tree.
    If the library contains several materials with the same name, the last one is used.

    :param library: is the library where the materials used in the tree are stored.
    :param node: is a graphical node, for instance it can be the root_node of a graphical scene.
    :return: a pair (found,not_found) where found is the set of found materials and not_found is the set of mesh names that were not found in the library (if any).

.. py:function:: desc.graphic.getMaterialsFromGraphicalTree(library, node)

.. py:function:: desc.graphic.getMeshRefsFromGraphicalTree(library, node)

    Returns the names of the meshes referenced in a graphical tree.
    If the library contains several meshes with the same name, the last one is used.

    :param library: is the library where the meshes used in the tree are stored.
    :param node: is a graphical node, for instance it can be the root_node of a graphical scene.
    :return: a pair (found,not_found) where found is the set of found meshes and not_found is the set of mesh names that were not found in the library (if any).

.. py:function:: desc.graphic.getMeshesFromGraphicalTree(library, node)

.. py:function:: desc.graphic.renameMaterialReference(node, material_ref_name, new_material_ref_name)

    Rename a reference to a material.

    :param node: is the root of the subtree.
    :param material_ref_name: is a string.
    :param new_material_ref_name: is a string.

.. py:function:: desc.graphic.renameMeshReference(node, mesh_ref_name, new_mesh_ref_name)

    Rename a reference to a mesh.

    :param node: is the root of the subtree.
    :param mesh_ref_name: is a string.
    :param new_mesh_ref_name: is a string.

.. py:function:: desc.graphic.setNodePosition(node, H)

    Sets the position field of a node.

    :param node: is a collision or graph node.
    :param H: is an lgsm displacement.

.. py:function:: desc.graphic.setNodeScale(node, scale)

    Changes the scale of a node. An isometric scale can be specified, or a list of three scales.

    :param scale: is either a float, int or long, or a list of three ints, floats or longs.

