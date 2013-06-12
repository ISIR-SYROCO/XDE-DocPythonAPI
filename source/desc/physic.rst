desc.physic
===========
.. toctree::
    :glob:

.. py:function:: desc.physic.absolutePositions(root, H=<Displacement x,y,z,qw,qx,qy,qz = (0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0)>, scale=[1, 1, 1])

.. py:function:: desc.physic.addCable(physical_scene, name, **kwargs)

    Adds a cable to a physical scene. See createCable for a description of the parameters.

    :return: the created description

.. py:function:: desc.physic.addContactLaw(physical_scene, material_i, material_j, law_type, friction, contensou_radius=0.1)

.. py:function:: desc.physic.addMechanism(physical_scene, name, root_node, trim_nodes=[], bodies=[], segments=[])

    Adds the description of a mechanism to a physical scene. A mechanism is a view of
    a physical subtree (with optionally trimmed branches) containing only unit or serial unit joints.

    :param physical_scene: is a destination physical_scene.
    :param name: is the name of the mechansim.
    :param root_node: is the name of the root body of the mechanism.
    :param trim_nodes: is a list of nodes to trom from the mechanism.
    :param bodies: are lists of strings that specify a mapping between names that are internal to the mechanism (segment names), and names that are valid in the scene tree (body names).
    :param segments: are lists of strings that specify a mapping between names that are internal to the mechanism (segment names), and names that are valid in the scene tree (body names).

.. py:function:: desc.physic.addPhysicalNode(physical_scene, name, parent_node=None)

.. py:function:: desc.physic.computeInertiaParameters(rigid_body, library, composite_mesh)

.. py:function:: desc.physic.fillBallJoint(joint, name, H_child_parent, center_in_parent, damping)

    Creates a ball joint description.

    :param name: is the joint name
    :param type: is the joint type (physic_pb2.UnitJoint.HINGE, physic_pb2.UnitJoint.PRISMATIC, ...)
    :param H_child_parent: is the position/orientation of the child frame when q=qref
    :param  center_in_parent: is a list of three values which are the coordinates of the center of rotation in the parent frame.
    :param  damping: is a rotational damping (one real value)
    :return: the protobuf description of a ball joint.

.. py:function:: desc.physic.fillCable(cable, name, **kwargs)

    Instantiation and creation of the protobuf description of a cable.

    :param [required] number_of_nodes: is the number of nodes of the cable
    :param [required] linear_mass: is the linear mass of the cable
    :param [required] damping: is the internal damping of the cable
    :param [optional] ambient_rotation_damping: is the ambient rotation damping of the cable
    :param [optional] ambient_translation_damping: is the ambient translation damping of the cable
    :param [required] materials: is a list of all the materials of the cable. 1 material minimum is required.

      A material is a dictionary with the following parameters:
        :param [required] young_modulus: young modulus of the material
        :param [required] shear_modulus: shear modulus of the material
        :param [required] section_radius: radius of the material inside the cable
    :param [required] reference_configuration: is a dictionary describing the cable reference configuration:
        :param [required] type: is the reference configuration type
        :param [required] pos: is the configuration positions:

            * if type == 0 then you only have to specify the initial and final translations (straight cable)
            * if type == 1 then you have to specify all the nodes translations (the rotations will be automatically computed)
            * if type == 2 then you have to specify all the nodes translations and rotations
    :param [optional] connectors: is a list of rigid body to connect to certain cable node. For instance, if one needs to connect the first cable node to an existing "ground" rigid body and the final node to an existing "ball" rigid body then : connectors = [(0,"ground"), (number_of_nodes-1,"ball")]
    :return: the created description

.. py:function:: desc.physic.fillFixedJoint(joint, name, H_child_parent)

    Instantiation/initialization of a fixed joint.
    See createRawJoint for a description of the parameters.

.. py:function:: desc.physic.fillFreeJoint(joint, name, H_child_parent, trs_damping=0, rot_damping=0)

    Creates a free joint description.

    :param name: is the joint name
    :param type: is the joint type (physic_pb2.UnitJoint.HINGE, physic_pb2.UnitJoint.PRISMATIC, ...)
    :param H_child_parent: is the position/orientation of the child frame when q=qref
    :param  trs_damping: [default:0] is a translational damping (one real value)
    :param  rot_damping: [default:0] is a rotational damping (one real value)
    :return: the protobuf description of a free joint.

.. py:function:: desc.physic.fillHingeJoint(joint, name, H_child_parent, center_in_parent, axis_in_parent, damping, qmin, qmax, ref_pos)

    Fills the description of a unit joint.

    :param name: is the joint name
    :param type: is the joint type (physic_pb2.UnitJoint.HINGE, physic_pb2.UnitJoint.PRISMATIC, ...)
    :param H_child_parent: is the position/orientation of the child frame when q=qref
    :param  center_in_parent: is a list of three values which are the coordinates of a point of the rotation axis in the parent frame.
    :param  axis_in_parent: is a list of three values which are the coordinates of a the rotation axis in the parent frame.
    :param damping: is a real value.
    :param qmin: is the lower joint limit.
    :param qmax: is the upper joint limit.
    :param ref_pos: is such that if q=qref, the position/orientation of the child frame in the parent frame is H_child_parent.
    :return: the created element.
    :note: if qmin==qmax, the joint limits are disabled.

.. py:function:: desc.physic.fillJoint(joint, name, type, H_child_parent)

    Creates a basic joint description without type-specific initialization. Such a description cannot be
    used directly; specific information must be provided, using for instance createFreeJoint, createBallJoint and so on.
    This function can however be used as a basis to initialize custom joint descriptions, or less usual joint descriptions.

    :param name: is the joint name
    :param type: is the joint type (physic_pb2.UnitJoint.HINGE, physic_pb2.UnitJoint.PRISMATIC, ...)
    :param H_child_parent: is the position/orientation of the child frame when q=qref
    :return: the protobuf description of a joint.

.. py:function:: desc.physic.fillPrismaticJoint(joint, name, H_child_parent, center_in_parent, axis_in_parent, damping, qmin, qmax, ref_pos)

    Fills the description of a prismatic joint. The parameters are the same as addHingeJoint, except that
    center_in_parent and axis_in_parent descript a translational axis, and damping is a translational damping.

.. py:function:: desc.physic.fillRigidBody(body, **kwargs)

    Instantiation and initialization of a rigid body.

    :param name: [default: None] is the name of the rigid body. If None, the name is unchanged.
    :param mass: [default: 1.] Avoid setting this to 0 except if your rigid body is fixed to the ground of the physical scene or to a body with a non-zero mass.
    :param moments_of_inertia: [default: [mass*2./5., mass*2./5., mass*2./5.]] is the list of principal moments of inertia. Default ones are for a sphere of radius r=1.
    :param H_inertia_segment: [default: lgsm.Displacement()] is the inertia frame, in the body frame. The center of the frame is the center of gravity and the orientation give the direction of the principal inertia axes.
    :param damping: [default: [0]*36] is the damping matrix for the body.
    :param weight_enabled: [default: True]. This is NOT equivalent to setting a mass to 0! This is equivalent to setting the gravity to 0 for only one body.
    :param damping_enabled: [default: True]
    :param contact_material: is a string that will impact friction with other bodies.

.. py:function:: desc.physic.fillSerialHingeJoint(joint, name, H_child_parent, center_in_parent, axis_in_parent, damping, qmin, qmax, ref_pos)

    Fills the description of a serial hinge joint. The parameters are the same as addHingeJoint, except that
    axis_in_parent, damping, qmin, qmax are sequences, so that each element specifies one of the hinge joints of the serial hinge. The first element in the list specifies the hinge joint that is "closest" to the parent frame.

.. py:function:: desc.physic.fillUnitJointParam(joint, name, type, center_in_parent, axis_in_parent, damping, qmin, qmax, reference_position)

    Creates the basic description of a unit joint. See addHingeJoint for a description of the parameters. If qmin==qmax,
    the joint limits will be disabled. The type of unit joint must be specified (PRISMATIC, HINGE, HELICOIDAL, ...)

.. py:function:: desc.physic.findInPhysicalScene(physical_scene, to_find)
.. py:function:: desc.physic.findInTree(node, to_find)
.. py:function:: desc.physic.getNodeName(node)
.. py:function:: desc.physic.getNodePosition(node)
.. py:function:: desc.physic.getNodeScale(node)
.. py:function:: desc.physic.printTree(root)
.. py:function:: desc.physic.setNodePosition(node, H)
.. py:function:: desc.physic.trimNodes(root, trim_nodes)
