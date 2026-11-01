#!/usr/bin/env bash
# Downloads the SKY130 liberty file and the gate-level Verilog models into ./lib
set -e
ROOT="$(cd "$(dirname "$0")/.." && pwd)"
mkdir -p "$ROOT/lib/verilog_model"
LIBF="$ROOT/lib/sky130_fd_sc_hd__tt_025C_1v80.lib"
if [ ! -s "$LIBF" ]; then
  echo "[setup] downloading SKY130 HD typical liberty file (~12 MB)..."
  curl -sSL -o "$LIBF" \
   https://raw.githubusercontent.com/efabless/skywater-pdk-libs-sky130_fd_sc_hd/master/timing/sky130_fd_sc_hd__tt_025C_1v80.lib
fi
if [ ! -s "$ROOT/lib/verilog_model/sky130_fd_sc_hd.v" ]; then
  echo "[setup] fetching SKY130 gate-level simulation models..."
  tmp=$(mktemp -d)
  git clone --depth 1 https://github.com/kunalg123/sky130RTLDesignAndSynthesisWorkshop.git "$tmp/w" >/dev/null 2>&1
  cp "$tmp/w/my_lib/verilog_model/"*.v "$ROOT/lib/verilog_model/"
  rm -rf "$tmp"
  # newer Icarus versions reject trailing text after `endif / `else
  sed -i -E 's/^(`endif)[ \t]+[A-Za-z0-9_]+.*$/\1/; s/^(`else)[ \t]*\/\/.*$/\1/' "$ROOT"/lib/verilog_model/*.v
fi
echo "[setup] done:"; ls -la "$ROOT/lib" "$ROOT/lib/verilog_model"
