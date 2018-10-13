#!/bin/bash

hwsensors () {
	watch -tn1 "lscpu | grep MHz; printf '\n\n'; sensors"
}
