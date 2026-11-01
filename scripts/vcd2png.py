#!/usr/bin/env python3
"""Tiny VCD -> PNG renderer (needs matplotlib).  usage: vcd2png.py in.vcd out.png [sig1 sig2 ...]"""
import sys, re
import matplotlib; matplotlib.use("Agg")
import matplotlib.pyplot as plt

def parse(path):
    ids, names, widths, scope = {}, {}, {}, []
    data = {}
    t = 0
    global SCALE
    SCALE = 1.0
    with open(path) as f:
        header = True
        for line in f:
            line = line.strip()
            if header:
                if line.startswith("$timescale") or re.fullmatch(r"\d+\s*(fs|ps|ns|us)", line):
                    m = re.search(r"(\d+)\s*(fs|ps|ns|us)", line)
                    if m: SCALE = int(m.group(1)) * {"fs":1e-6,"ps":1e-3,"ns":1,"us":1e3}[m.group(2)]
                if line.startswith("$scope"): scope.append(line.split()[2])
                elif line.startswith("$upscope"): scope.pop()
                elif line.startswith("$var"):
                    p = line.split(); w = int(p[2]); ident = p[3]; nm = p[4]
                    if len(scope) == 2:               # signals of the testbench top
                        ids.setdefault(ident, nm); widths[ident] = w; data.setdefault(ident, [])
                elif line.startswith("$enddefinitions"): header = False
                continue
            if not line or line.startswith("$"): continue
            if line[0] == "#": t = int(line[1:]); continue
            if line[0] in "01xzXZ" and len(line) > 1 and line[1:] in ids:
                data[line[1:]].append((t, line[0]))
            elif line[0] == "b":
                v, ident = line[1:].split()
                if ident in ids: data[ident].append((t, v))
    return ids, widths, data, t

def val(v):
    return int(v, 2) if set(v) <= set("01") else None

def main():
    vcd, out = sys.argv[1], sys.argv[2]
    want = sys.argv[3:]
    ids, widths, data, tend = parse(vcd)
    data = {k: [(t * SCALE, v) for t, v in lst] for k, lst in data.items()}
    tend = tend * SCALE
    sigs = [(ids[i], i) for i in ids if (not want or ids[i] in want)]
    if want: sigs.sort(key=lambda s: want.index(s[0]))
    fig, axes = plt.subplots(len(sigs), 1, figsize=(9, 0.9 * len(sigs) + 0.8), sharex=True)
    if len(sigs) == 1: axes = [axes]
    for ax, (nm, i) in zip(axes, sigs):
        pts = data[i] + [(tend, data[i][-1][1] if data[i] else "0")]
        w = widths[i]
        if w == 1:
            xs, ys = [], []
            for k, (t, v) in enumerate(pts):
                y = 1 if v == "1" else 0
                if xs: xs.append(t); ys.append(ys[-1])
                xs.append(t); ys.append(y)
            ax.step(xs, ys, where="post", color="#1f77b4", lw=1.6)
            ax.set_ylim(-0.3, 1.3); ax.set_yticks([0, 1])
        else:
            for (t0, v), (t1, _) in zip(pts, pts[1:]):
                n = val(v)
                ax.add_patch(plt.Rectangle((t0, 0), t1 - t0, 1, fc="#e8f0fe", ec="#1f77b4"))
                if t1 - t0 > tend * 0.03:
                    ax.text((t0 + t1) / 2, 0.5, "x" if n is None else hex(n)[2:] if w > 4 else str(n), ha="center", va="center", fontsize=8)
            ax.set_ylim(0, 1); ax.set_yticks([])
        ax.set_ylabel(nm, rotation=0, ha="right", va="center", fontsize=9)
        ax.set_xlim(0, tend)
        for s in ("top", "right"): ax.spines[s].set_visible(False)
    axes[-1].set_xlabel("time (ns)")
    plt.tight_layout(); plt.savefig(out, dpi=130); print("wrote", out)
main()
