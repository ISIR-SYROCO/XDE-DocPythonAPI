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

    .. py:method:: __init__(self, dest, source)

       Starts a dry run of a merge process. After construction, you will be able to access the
       elements that will be added to the target collection by calling the newElements method,
       as well of the list of conflicting elements. Applying the merge will ignore all conflicts
       and only add those elements whose name did not conflict with names from the target collection.

       :param dest: is a target collection where to add elements.
       :param source: is a source collection to merge into the destination collection.

    .. py:method:: conflicts(self)

        Returns the name of conflicting elements.

        :return: a list of conflicting names (strings).

    .. py:method:: conflictsResoved(self)

        Returns True if all conflicts have been resolved (by one or several calls to the resolveConflicts method).

        :return: True if the conflicts method returns an empty list, False otherwise.

    .. py:method:: elementsToIgnore(self)

        Returns the names of the conflicting elements that the user chose to ignore (they won't be added
        to the target collection) using the resolveConflict method with the KEEP_DEST flag.

        :return: a list of strings.

    .. py:method:: elementsToOverwrite(self)

        Returns the names of the conflicting elements that the user chose to overwrite with the source
        collection's elements using the resolveConflict method with the KEEP_SOURCE flag.

        :return: a list of strings.

    .. py:method:: elementsToRename(self)

        Returns the names of cnflicting elements that will be inserted into the target collection
        with a new name.

        :return: a list of pairs of strings.

    .. py:method:: newElements(self)

        Returns the names of elements that will be added to the target collection (those who did
        not conflict).

        :return: a list of strings.

    .. py:method:: progression(self)

        The merge process is completed once all elements from the source have been treated by the
        apply method. This method returns the percentage of treated elements.

        :return: a float between 0. and 100.

    .. py:method:: resetDryRun(self)

        Brings back the merge process to the state it was after last call to the apply method.
        Changes that have been applied cannot be undone. If apply was never called, brings back the merge process
        to the state it was after construction.

    .. py:method:: resolveConflicts(self, strategy_dict)

        This method allows the user to specify how to handle conflicts, by specifying a strategy for each conflicting
        name, using a dictionary.

        :param strategy_dict: is a dictionary string->int or (int,string). The keys of the dict are conflicting names, and the values are either an integer (KEEP_SOURCE or KEEP_DEST) or a pair integer/string (RENAME_SOURCE,new_name), where new_name is the name to use for the source element once it is inserted into the destination collection.
        :exception NameError:  if the merge will add an element e1 with name "toto", and the user specifies to solve a conflict involving an element e2 with name "foo" by renaming e2 "toto", the function will fail without modifying the current merge state (no conflict will be processed, the user has to specify another strategy dictionary).
        :exception RuntimeError: if the specified strategy is incorrect (unknown resolution flag or format).

        ::

            Example strategy dict:
            {
                "toto": KEEP_SOURCE, # we overwrite the element with name "toto" in the target collection with the one in the source collection
                "tata": KEEP_DEST,   # we ignore the element with name "tata" from the source collection and keep the one in the target collection untouched.
                "yoyo": (RENAME_SOURCE,"yeye") # the source element named "yoyo" will be added to the target collection. Its copy in the target collection will be renamed "yeye".
            }


