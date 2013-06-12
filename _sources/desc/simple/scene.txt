desc.simple.scene
=================
.. toctree::
    :glob:

.. automodule:: desc.simple.scene
    :members:
    :undoc-members:
    :inherited-members:
    :show-inheritance:
    :special-members:
    :private-members:

.. py:function:: desc.simple.scene.addBinding(world, phy, graph, graph_ref, coll)

    Adds an association between a physical element, a graphical element, a collision element.
    Specify empty string to ignore one element (only associate a physical and a collision element, or only
    physics and graphics, and so on).
    A physical element can be associated to two graphical elements: the graphical node of the scene tree
    that represents the body itself, and the graphical node that represents the parent of the rigid body
    in the physical scene. Since both scene trees do not have the same topology, the parent of a graphical
    node is not necessarily associated to the parent of its rigid body in the physical tree.
    This asoociation between one physical node and two graphical nodes allows the mapping between a physical tree
    and a a graphical tree with finer grain.

.. py:function:: desc.simple.scene.createWorld(name='root', H=<Displacement x,y,z,qw,qx,qy,qz = (0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0)>, scale=matrix([[ 1.], [ 1.], [ 1.]]))

    Creates an empty world with graphical root initialized with given name, scale and displacement.

    :param name: [default: "root"] is the name of the graphical root.
    :param H: [default: lgsm.Displacement()] is the root displacement.
    :param scale: [default: lgsm.vector(1,1,1)] is the scale of the root node.
    :return: an empty, new world message whose graphical scene has been correctly initialized.

.. py:function:: desc.simple.scene.parseColladaFile(file_name, root_node_name='root', append_label_library='', append_label_nodes='', append_label_graph_meshes='', float_values=False)

    Parses a dae file to produce a scene_pb2.World instance. By default, the protobuf messages will be filled with double-precision real values (C++'s double).
    Single-precision values can be obtained via the optional argument 'float_values'.

    :param file_name: is the name of the file to parse.
    :param root_node_name: [default: "root"] is the name of the root node.
    :param append_label_library: [default: ""] specifies whether to append a string label to the name of all loaded library entities (in which case any reference to them is updated).
    :param append_label_nodes: [default: ""] specifies whether to append a string label to the name of all loaded nodes.
    :param append_label_graph_meshes: [default: ""] specifies whether to append a string label to the name of all loaded graphical meshes.
    :param float_values: [default: False] can be specified to fill the protobuf messages with single-precision real values (C++'s float).
    :return: a protobuf message scene_pb2.World containing an initialized graphical scene matching the content of the given dae file.
