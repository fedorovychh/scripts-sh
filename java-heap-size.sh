#!/bin/bash

java -XX:+PrintFlagsFinal -version | grep HeapSize
