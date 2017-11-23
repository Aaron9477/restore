#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
    DESTDIR_ARG="--root=$DESTDIR"
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/zq610/WYZ/wyz2_ws/src/vision_opencv-kinetic/cv_bridge"

# snsure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/zq610/WYZ/wyz2_ws/install/lib/python2.7/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/zq610/WYZ/wyz2_ws/install/lib/python2.7/dist-packages:/home/zq610/WYZ/wyz2_ws/build/lib/python2.7/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/zq610/WYZ/wyz2_ws/build" \
    "/usr/bin/python" \
    "/home/zq610/WYZ/wyz2_ws/src/vision_opencv-kinetic/cv_bridge/setup.py" \
    build --build-base "/home/zq610/WYZ/wyz2_ws/build/vision_opencv-kinetic/cv_bridge" \
    install \
    $DESTDIR_ARG \
    --install-layout=deb --prefix="/home/zq610/WYZ/wyz2_ws/install" --install-scripts="/home/zq610/WYZ/wyz2_ws/install/bin"
