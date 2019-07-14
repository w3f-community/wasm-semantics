(module
  (func (export "i32.reinterpret_f32") (param $x f32) (result i32) (i32.reinterpret_f32 (local.get $x)))
  (func (export "i64.reinterpret_f64") (param $x f64) (result i64) (i64.reinterpret_f64 (local.get $x)))
)

(assert_return (invoke "i32.reinterpret_f32" (f32.const -nan)) (i32.const 0xffc00000))
(assert_return (invoke "i64.reinterpret_f64" (f64.const 3.14159265358979)) (i64.const 4614256656552045841))

#clearConfig
