require 'test_helper'

class ThreeTildesTest < Minitest::Test
  def test_basic
    input = <<~INPUT
    ```exercism/note
    something
    ```
    INPUT

    output = <<~OUTPUT
    ~~~~exercism/note
    something
    ~~~~
    OUTPUT

    assert_equal output, AdmonitionBlockFormatter.format(input)
  end

  def test_fuller
    input = <<~INPUT
    something

    ```exercism/note
    some code
    with a `variable` here
    some other code
    ```

    endstuff
    INPUT

    output = <<~OUTPUT
    something

    ~~~~exercism/note
    some code
    with a `variable` here
    some other code
    ~~~~

    endstuff
    OUTPUT

    assert_equal output, AdmonitionBlockFormatter.format(input)
  end

  def test_multiple
    input = <<~INPUT
    something

    ```exercism/note
    some code
    ```

    else

    ```exercism/note
    other code
    ```

    endstuff
    INPUT

    output = <<~OUTPUT
    something

    ~~~~exercism/note
    some code
    ~~~~

    else

    ~~~~exercism/note
    other code
    ~~~~

    endstuff
    OUTPUT

    assert_equal output, AdmonitionBlockFormatter.format(input)
  end
end
