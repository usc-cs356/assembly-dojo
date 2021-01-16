.global  add_two_integers

add_two_integers:
    movl %edi,%eax   # move x to eax
    addl %esi,%eax   # add y to eax
    ret              # return value is in eax
