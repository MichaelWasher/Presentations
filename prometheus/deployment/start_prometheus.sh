#!/bin/bash
prometheus --config=$(pwd)/prometheus.yml &

node_exporter
