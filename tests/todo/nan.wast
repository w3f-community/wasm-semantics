(module
  (func (export "add") (param $x f32) (param $y f32) (result f32) (f32.add (local.get $x) (local.get $y)))
  (func (export "min") (param $x f32) (param $y f32) (result f32) (f32.min (local.get $x) (local.get $y)))
  (func (export "copysign") (param $x f32) (param $y f32) (result f32) (f32.copysign (local.get $x) (local.get $y)))
)

(assert_return_canonical_nan (invoke "add" (f32.const -0.88) (f32.const -nan)))
(assert_return_arithmetic_nan (invoke "add" (f32.const -0.5) (f32.const -nan:0x200000)))
(assert_return_arithmetic_nan (invoke "min" (f32.const -0.5) (f32.const -nan:0x200000)))
(assert_return (invoke "copysign" (f32.const 0.123) (f32.const -nan)) (f32.const 0.123))

#clearConfig
