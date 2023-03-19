# As the 'govuk_publishing_components' gem breaks live asset compilation for tests that run through Capybara,
# this workaround is needed for precompiling the assets instead.

Rake::Task['test:system'].enhance ['assets:precompile']
