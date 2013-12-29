cookbook_path    ["cookbooks", "site-cookbooks"]
node_path        "nodes"
role_path        "roles"
environment_path "environments"
data_bag_path    "data_bags"
# This is useful/required for knife solo data bag (encrypted data bags)
encrypted_data_bag_secret "some_key_file"

knife[:berkshelf_path] = "cookbooks"
