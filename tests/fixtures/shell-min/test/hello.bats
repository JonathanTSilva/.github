@test "greets the world by default" {
  run ./hello.sh
  [ "$status" -eq 0 ]
  [ "$output" = "hello, world" ]
}

@test "greets a name" {
  run ./hello.sh ada
  [ "$output" = "hello, ada" ]
}
