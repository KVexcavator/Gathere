RSpec Predefined Matchers

expect(array).to all(matcher)
expect(actual).to be > expected  # (also works with <, >=, <=, and ==)
expect(actual).to be_a(type)
expect(actual).to be_truthy
expect(actual).to be_falsy
expect(actual).to be_nil
expect(actual).to be_between(min, max)
expect(actual).to be_within(delta).of(expected)
expect { block }.to change(receiver, message, &block)
expect(actual).to contain_exactly(expected)
expect(range).to cover(actual_value)
expect(actual).to eq(expected)
expect(actual).to exist
expect(actual).to have_attributes(key/value pairs)
expect(actual).to include(*expected)
expect(actual).to match(regex)
expect { block }.to output(value).to_stdout  # also to_stderr
expect { block }.to raise_error(exception)
expect(actual).to satisfy { block }
