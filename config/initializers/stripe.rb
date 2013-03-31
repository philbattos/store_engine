Rails.configuration.stripe = {
  # :publishable_key => ENV['PUBLISHABLE_KEY'],
  # :secret_key      => ENV['SECRET_KEY']

  :publishable_key => "pk_test_R4wkXJfLABwNPnCPMGV6tvPu",
  :secret_key      => "sk_test_vmEo8VTliUdaddd6pBp1jQnG"
}

Stripe.api_key = Rails.configuration.stripe[:secret_key]