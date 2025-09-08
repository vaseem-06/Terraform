resource "local_file" "my_pet" {
  filename = "pets.txt"
  content  = "I hate pets"
}
