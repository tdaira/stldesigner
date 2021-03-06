import argparse
import matplotlib.pyplot as plt
import numpy as np
import re

imp_re = re.compile("^RLGCMODEL=[A-Z](\d+)$")
len_re = re.compile("^L=(([0-9]*[.])?[0-9]+[cmunpf])$")


def run():
    parser = argparse.ArgumentParser(description='Create segment graph from spice file.')
    parser.add_argument('-f', '--spice-file', metavar='[file]', type=str, required=True,
                        help='Spice file generated by stldesigner.')
    parser.add_argument('--eps', metavar='[file]', type=str, required=False, default='',
                        help='Output EPS file name. If it is no specified, file is not outputted.')

    args = parser.parse_args()

    with open(args.spice_file) as f:
        start_re = re.compile("^\*\*\*.*Subspaces.*$")
        end_re = re.compile("^\*\*\*.*$")
        stl_re = re.compile("^.\d+_SEG_\d+.*$")
        imp_list = []
        len_list = [0.0]
        total_len = 0
        subspace_flag = False
        while True:
            line = f.readline()
            if not line:
                break
            if start_re.match(line):
                subspace_flag = True
                continue
            if end_re.match(line):
                subspace_flag = False
                continue
            if not subspace_flag:
                continue
            if stl_re.match(line):
                seg_imp = get_imp(line)
                seg_len = get_len(line)
                total_len += seg_len
                imp_list.append(seg_imp)
                len_list.append(total_len)

    imp_list_np = np.array(imp_list)
    len_list_np = np.array(len_list)

    widths = len_list_np[1:] - len_list_np[:-1]
    positions = len_list_np[:-1] + widths / 2

    ax = plt.axes()
    ax.set_xlabel('Length [m]')
    ax.set_ylabel('Impedance [Ω]')
    plt.bar(positions, imp_list_np, width=widths, color='b', edgecolor='k')
    if args.eps != '':
        plt.savefig(args.eps)
    else:
        plt.show()


def get_imp(str):
    vals = str.split()
    return int(imp_re.match(vals[5]).group(1))


def get_len(str):
    vals = str.split()
    return val_to_float(len_re.match(vals[7]).group(1))


def val_to_float(val):
    val = val.replace('c', 'e-2')
    val = val.replace('m', 'e-3')
    val = val.replace('u', 'e-6')
    val = val.replace('n', 'e-9')
    val = val.replace('p', 'e-12')
    val = val.replace('f', 'e-15')
    return float(val)


if __name__ == '__main__':
    run()
