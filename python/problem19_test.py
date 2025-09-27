import pytest
import os
from problem19 import count_sundays

# Генерируем параметры для тестов
test_cases = []
base_input = "../test/resources/problem19/input/input"
base_output = "../test/resources/problem19/output/output"

for i in range(1, 11):
    input_file = f"{base_input}_{i}.txt"
    output_file = f"{base_output}_{i}.txt"
    
    if os.path.exists(input_file) and os.path.exists(output_file):
        test_cases.append((input_file, output_file))

@pytest.mark.parametrize("input_file,output_file", test_cases)
def test_grid_product(input_file, output_file):
    year = int(open(input_file).read())
    expected = int(open(output_file).read())
    actual = count_sundays(year)
    assert actual == expected, f"Test failed for {input_file}: expected {expected}, got {actual}"

if __name__ == "__main__":
    pytest.main([__file__, "-v"])