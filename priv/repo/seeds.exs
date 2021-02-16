# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
Muspha.Accounts.create_elector!(%{
  first_name: "test first name",
  last_name: "test second name",
  password: "someStrong@1",
  email: "test@test.com",
  admission_no: "PH123/122"
})

#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
