<?php

/* index/index.html */
class __TwigTemplate_fb566f0825e0f39f8616b9058394ca9fd4d76b9a0504a6225cf91fa4ad1ebf6e extends Twig_Template
{
    public function __construct(Twig_Environment $env)
    {
        parent::__construct($env);

        $this->parent = false;

        $this->blocks = array(
        );
    }

    protected function doDisplay(array $context, array $blocks = array())
    {
        // line 1
        echo "<!DOCTYPE html>
<html>
    <head>
        <title>Start Page</title>
    </head>
    <body>
        ";
        // line 7
        $context["test"] = "test";
        // line 8
        echo "        ";
        echo twig_escape_filter($this->env, twig_template_get_attributes($this, (isset($context["pageData"]) ? $context["pageData"] : null), "startTime", array()), "html", null, true);
        echo "
        ";
        // line 9
        echo twig_escape_filter($this->env, (isset($context["test"]) ? $context["test"] : null), "html", null, true);
        echo "
    </body>
</html>
";
    }

    public function getTemplateName()
    {
        return "index/index.html";
    }

    public function isTraitable()
    {
        return false;
    }

    public function getDebugInfo()
    {
        return array (  34 => 9,  29 => 8,  27 => 7,  19 => 1,);
    }
}
