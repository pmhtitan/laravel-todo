<?php

namespace App\View\Components;

use Illuminate\View\Component;

class welcomecustom extends Component
{

    /*
     Pasar un data de la view al component (sí, hay que hacer todo este coñazo.)     
     */

    public $tasks;

    /**
     * Create a new component instance.
     *
     * @return void
     */
    public function __construct($tasks)
    {
        //
      $this->tasks = $tasks;
    }

    /**
     * Get the view / contents that represent the component.
     *
     * @return \Illuminate\Contracts\View\View|\Closure|string
     */
    public function render()
    {
        return view('components.welcomecustom');
    }
}
