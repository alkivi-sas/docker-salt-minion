======================
SaltStack Docker Image
======================

Docker images to run SaltStack salt-minion as Docker container.
container.

Build
=====

.. code-block:: bash

    docker build -t salt-minion -f Dockerfile --build-args version=latest .

Run
===

First create directories on your host and set permissions:

.. code-block:: bash

    mkdir -p /srv/salt /srv/salt/pki/minion/minions

Run salt-minion manually:

.. code-block:: bash

    docker run -d -v /srv/salt/pki:/etc/salt/pki -v /srv/salt:/srv/salt salt-minion

Configuration
=============

You should also get some formulas into ``/srv/salt`` directory.

If you want to make some customizations (eg. on environment locations, add new
volume as ``/etc/salt/minion.d/env.conf`` or ``/etc/salt/minion.d`` to replace
custom configuration completely.
