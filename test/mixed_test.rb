require 'test_helper'

class MixedTest < Minitest::Test
  def test_three_then_four_then_three
    input = <<~INPUT
    something

    ```exercism/note
    code 1
    ```

    ````exercism/note
    code 2
    ````

    ```exercism/note
    code 3
    ```

    end bit
    INPUT

    output = <<~OUTPUT
    something

    ~~~~exercism/note
    code 1
    ~~~~

    ~~~~exercism/note
    code 2
    ~~~~

    ~~~~exercism/note
    code 3
    ~~~~

    end bit
    OUTPUT

    assert_equal output, AdmonitionBlockFormatter.format(input)
  end

  def test_four_then_three_then_four
    input = <<~INPUT
    something

    ````exercism/note
    code 1
    ````

    ```exercism/note
    code 2
    ```

    ````exercism/note
    code 3
    ````

    end bit
    INPUT

    output = <<~OUTPUT
    something

    ~~~~exercism/note
    code 1
    ~~~~

    ~~~~exercism/note
    code 2
    ~~~~

    ~~~~exercism/note
    code 3
    ~~~~

    end bit
    OUTPUT

    assert_equal output, AdmonitionBlockFormatter.format(input)
  end

end

