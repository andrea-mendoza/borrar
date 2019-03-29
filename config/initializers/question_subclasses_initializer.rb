# By default, Rails does not load STI subclasses on
# development env. If we add a subclass we need to add
# its name to this file to force leoading.
[   Questions::SelectOption,
    Questions::Text
] if Rails.env == 'development'