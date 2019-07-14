(module
  (func (export "add") (param $x f64) (param $y f64) (result f64) (f64.add (local.get $x) (local.get $y)))
  (func (export "f64.no_contraction") (param $x f64) (param $y f64) (param $z f64) (result f64)
    (f64.add (f64.mul (local.get $x) (local.get $y)) (local.get $z)))
)

(assert_return (invoke "add" (f64.const -0x0.0000000000001p-1022) (f64.const -0x1p-1)) (f64.const -0x1p-1))
(assert_return (invoke "add" (f64.const 0x1.921fb54442d18p+2) (f64.const -0x1p-1022)) (f64.const 0x1.921fb54442d18p+2))(assert_return (invoke "add" (f64.const -0x1.921fb54442d18p+2) (f64.const -0x1.921fb54442d18p+2)) (f64.const -0x1.921fb54442d18p+3))
(assert_return (invoke "f64.no_contraction" (f64.const -0x1.9e87ce14273afp-103) (f64.const 0x1.2515ad31db63ep+664) (f64.const 0x1.868c6685e6185p+533)) (f64.const -0x1.da94885b11493p+561))

#clearConfig
