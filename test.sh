#!/bin/bash

rm -f perf.log

echo Rust |tee -a perf.log
sudo perf stat ./isqrt-rs 2>&1 |sed 's/ / /g' |tee -a perf.log

echo Gcc |tee -a perf.log
sudo perf stat ./isqrt-gcc 2>&1 |sed 's/ / /g' |tee -a perf.log

echo CLang |tee -a perf.log
sudo perf stat ./isqrt-clang 2>&1 |sed 's/ / /g' |tee -a perf.log

echo SSE |tee -a perf.log
sudo perf stat ./sse-isqrt 2>&1 |sed 's/ / /g' |tee -a perf.log

echo Fast |tee -a perf.log
sudo perf stat ./fast-isqrt 2>&1 |sed 's/ / /g' |tee -a perf.log

echo Slow |tee -a perf.log
sudo perf stat ./slow-isqrt 2>&1 |sed 's/ / /g' |tee -a perf.log
