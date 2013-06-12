desc.merge
==========
.. toctree::
    :glob:

.. py:module:: desc.merge

.. py:class:: desc.merge.MergeCollectionsProcess(__builtin__.object)

    This class allows to merge collections of named entities such as scene_pb2.Library.meshes or
    scene_pb2.Library.materials.
    It tries to merge a source collection (for instance src_library.meshes) into a destination collection
    (for instance dest_library.meshes).
    Ideally, when no name conflict occurs, the result is equivalent to
    dest_library.meshes.extend(src_library.meshes).

    However, it might happen that elements in the source collection have
    the same name as elements that are already present
    in the destination collection. In such a case, the user can specify different strategies:

    #. to keep the original element and ignore the one from the source collection (KEEP_DEST),
    #. to replace the original element with the one from the source collection (KEEP_SOURCE),
    #. to import the source element with a new name (RENAME_SOURCE).

    Note that in the third case, the source element is actually not renamed:
    only its copy in the target collection is renamed.
    This class is used in three stages:

    #. construction: a first evaluation of the conflicts is performed. No merge is actually done, but a dry run is processed to evaluate what will be the results of the merge process.
    #. conflicts resolution: as long as there are conflicts, the user can call the resolveConflict method with a conflict resolution strategy: for each conflicting name, the user specifies KEEP_SOURCE, KEEP_DEST or (RENAME_SOURCE,new_name) where new_name is a user-defined string. This is still a dry-run: the effects of the user-specified strategy are evaluated and the dry-run progression is updated.
    #. apply: the effects of the merge are actually applied to the destination collection.

    The effects of a dry run can be cancelled, but the effects of apply cannot.
    Cancelling a dry run will bring back the merge process to
    the state it had after the last call to apply. If apply has never been called,
    the merge state is reseted to the initial state.

    Note that this merge process does not handle concurrent access!
    Different merge processes involving the same collections and
    running in parallel or interlaced manner will cause undefined behavior.

    .. py:method:: apply(self)

        This method actually applied the changes to the destination collection. Conflicting elements
        are not treated by this method, except the one resolved by the user. Changes made by this method
        cannot be undone. Remaining conflicts can be resolved afterwards and then this method can be called again.
        Note that elements that have been flagged as "to ignore" with the KEEP_DEST flag will be considered as merged,
        and their status cannot be changed during the process!

    .. py:method:: desc.merge.MergeCollectionsProcess.__init__(self, dest, source)

       Starts a dry run of a merge process. After construction, you will be able to access the
       elements that will be added to the target collection by calling the newElements method,
       as well of the list of conflicting elements. Applying the merge will ignore all conflicts
       and only add those elements whose name did not conflict with names from the target collection.

       :param dest: is a target collection where to add elements.
       :param source: is a source collection to merge into the destination collection.

