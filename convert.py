import re
import sys


def hex2float(h):
    if "nan" in h:
        return h.replace("nan", "NaN")
    elif "inf" in h:
        return h.replace("inf", "Infinity")
    else:
        return h.split()[0] + " " + str(float.fromhex(h.split()[1]))


def main():
    filename = sys.argv[1]
    infile = "tests/wasm-tests/test/core/%s" % filename
    outfile = open("tests/simple/%s-c.%s" % tuple(filename.split(".")), "w")
    unsupported = ["nan:", "trunc", "nearest",
                   "assert_return_canonical_nan", "assert_return_arithmetic_nan", "assert_invalid", "assert_malformed"]
    for line in (open(infile).readlines()):
        if any(x in line for x in unsupported):
            outfile.write(";; "+line)
        else:
            outfile.write(re.sub(r"(?:(?:f32|f64)\.const )([^\)]+)",
                                 lambda m: hex2float(m.group()), line))


if __name__ == "__main__":
    main()
