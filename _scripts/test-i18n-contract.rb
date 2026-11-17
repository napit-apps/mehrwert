# Run with: bundle exec ruby _scripts/test-i18n-contract.rb
require 'jekyll'
require 'tempfile'
require_relative '../_plugins/i18n_contract'

contract = MehrwertI18nContract
checks = 0
assert = lambda do |condition, message|
  raise message unless condition
  checks += 1
end
root = File.expand_path('..', __dir__)
site = Struct.new(:source, :config).new(root, YAML.load_file(File.join(root, '_config.yml')))
contract.validate(site)
assert.call(true, 'Current content contract')

reference = { 'title' => 'Visible text', 'items' => ['One'], 'published' => true }
[
  reference.reject { |key, _| key == 'title' },
  reference.merge('retired' => 'Unused'),
  reference.merge('title' => ''),
  reference.merge('items' => []),
  reference.merge('published' => 'true')
].each do |invalid|
  errors = []
  contract.compare(reference, invalid, 'en', errors)
  assert.call(!errors.empty?, "Invalid translation accepted: #{invalid}")
end
errors = []
contract.compare(reference, reference.merge('published' => false, 'title' => ''), 'en', errors)
assert.call(errors.empty?, 'Explicitly unpublished text must not require a translation')

Tempfile.create(['duplicate-i18n', '.yml']) do |file|
  file.write("pages:\n  title: First\n  title: Second\n")
  file.flush
  rejected = false
  begin
    contract.load_content(file.path)
  rescue Jekyll::Errors::FatalException
    rejected = true
  end
  assert.call(rejected, 'Duplicate YAML key accepted')
end

errors = []
contract.validate_review([{ 'key' => 'items.missing' }], { 'items' => ['One'] }, 'en', errors)
assert.call(!errors.empty?, 'Orphaned review entry accepted')
errors = []
contract.validate_review([{ 'key' => 'items.0' }], { 'items' => ['One'] }, 'en', errors)
assert.call(errors.empty?, 'Valid review array path rejected')

errors = []
contract.validate_testimonial_sources(
  { 'source_key' => 'leadership', 'source_author' => 'Author', 'published' => true },
  { 'common' => { 'testimonials' => { 'leadership' => {
    'published' => false, 'item' => [{ 'author' => 'Author', 'text' => 'Unapproved' }]
  } } } }, 'en', errors
)
assert.call(!errors.empty?, 'Unpublished source accepted as a published quotation')
puts "#{checks} i18n contract checks passed."
