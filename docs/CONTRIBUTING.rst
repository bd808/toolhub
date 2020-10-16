#################
How to contribute
#################

This document provides guidelines for people who want to contribute to the
Toolhub project.


***********************
Development environment
***********************

Dependencies
============
The following software will need to be installed on your local development
machine:

- Git_
- Curl_
- `Docker and Docker Compose`_
- `GNU Make`_

Getting started
===============
Toolhub's development environment is designed to allow you to test and run
everything from inside of a collection of Docker containers managed with
Docker Compose. The git repo contains a Makefile in its root directory that
should make working with `docker-compose` easier.

.. highlight:: shell-session

::

   $ git clone https://github.com/bd808/toolhub
   $ cd toolhub
   $ make init
   $ make test


Try running `make help` to see more make targets that you may find useful.

Configuration
=============
Toolhub follows the `twelve-factor app`_ pattern of storing deployment
variable configuration in the environment. The docker-compose.yaml file lists
all of the environment variables that can be set to change your local
configuration. The ``make init`` step will generate a .env file for you to start
from. This file will be automatically used by docker-compose to populate the
environment for your local containers.


.. _Git: https://git-scm.com/
.. _Curl: https://curl.haxx.se/
.. _`Docker and Docker Compose`: https://www.docker.com/
.. _`GNU Make`: https://www.gnu.org/software/make/
.. _`twelve-factor app`: https://12factor.net/
