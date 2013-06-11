#Please modify XDE_INSTALL_PATH
export XDE_INSTALL_PATH=/home/shak/compil/samaxe-64/

export XDE_bin=$XDE_INSTALL_PATH/bin
export XDE_lib=$XDE_INSTALL_PATH/bin
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:$XDE_lib:$XDE_lib/types
export XDE_LIBRARY_PATH=$XDE_lib
export XDE_PYTHON_PATH=$XDE_lib
export RTT_COMPONENT_PATH=$XDE_lib/ocl # do not look in /usr/lib/orocos/gnulinux/ocl/ it will override vector_string by strings

