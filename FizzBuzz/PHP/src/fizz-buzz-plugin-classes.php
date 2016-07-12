<?php

/**
 * All classes in the same file for a bird eye view
 * Usualy use one file per interface, class within a namespace
 */

interface FizzBuzzRuleInterface
{
    /**
     * @param int $number
     *
     * @return bool
     */
    public function matchRule($number);

    /**
     * @return string
     */
    public function getResponse();
}

class FizzBuzzRule implements FizzBuzzRuleInterface
{
    /**
     * @var int
     */
    protected $number;

    /**
     * @var string
     */
    protected $output;

    /**
     * @param int $number
     * @param string $output
     */
    public function __construct($number, $output)
    {
        $this->number = $number;
        $this->output = $output;
    }

    /**
     * @param int $number
     *
     * @return bool
     */
    public function matchRule($number)
    {
        return $number % $this->number === 0;
    }

    /**
     * @return string
     */
    public function getResponse()
    {
        return $this->output;
    }
}

class FizzBuzz
{
    /**
     * @var array
     */
    protected $rules = [];

    /**
     * @param FizzBuzzRuleInterface $ruleInterface
     *
     * @return $this
     */
    public function addRule(FizzBuzzRuleInterface $ruleInterface)
    {
        $this->rules[] = $ruleInterface;

        return $this;
    }

    /**
     * @param int $number
     *
     * @return string|int
     */
    public function execute($number)
    {
        /** @var FizzBuzzRuleInterface $rule */
        foreach ($this->rules as $rule) {
            if ($rule->matchRule($number)) {
                return $rule->getResponse();
            }
        }

        return $number;
    }
}

/*
$fizzBuzz = new FizzBuzz();
$fizzBuzz
    ->addRule(new FizzBuzzRule(15, 'FizzBuzz')) // add as many rules as you like without changing any class
    ->addRule(new FizzBuzzRule(3, 'Fizz'))
    ->addRule(new FizzBuzzRule(5, 'Buzz'))
;

// variant 1
for ($i = 1; $i <= 100; $i++) {
    echo $fizzBuzz->execute($i);
    echo "\n";
}

// variant 2
echo implode("\n", array_map([$fizzBuzz, 'execute'], range(1, 100)));
*/
