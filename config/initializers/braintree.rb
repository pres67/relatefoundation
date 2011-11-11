if Rails.env.production?
  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = "y6dz2cym4zwt9qp3"
  Braintree::Configuration.public_key = "cy8h2k35585tchmy"
  Braintree::Configuration.private_key = "mmy774by45xq62ys"
else
  Braintree::Configuration.environment = :sandbox
  Braintree::Configuration.merchant_id = "y6dz2cym4zwt9qp3"
  Braintree::Configuration.public_key = "cy8h2k35585tchmy"
  Braintree::Configuration.private_key = "mmy774by45xq62ys"
end
