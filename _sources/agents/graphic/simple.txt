agents.graphic.simple
=====================
.. toctree::
    :glob:

.. py:function:: agents.graphic.simple.createSingleView(graph)

    Create a single scene, window and viewport. This function is for simple setups only. This function simply creates a window and assumes Ogre has been properly configured and setup beforehand. It returns the scene, window and viewport names.

.. py:function:: agents.graphic.simple.setupSingleGLView(graph, resources=['...'])

    Complete Ogre initialization for simple setups. Instantiates an OpenGL context with a single view and returns the main scene interface, and the names of the scene, window and viewport.



