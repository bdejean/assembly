r0..r3 => params, scratch
r4..r8, r10..r11 => callee-saved
r9 ??
r12..r15 special


r12 = ip caller-saved
r13 = sp callee-saved
r14 = lr caller-saved
r15 = pc   == lr before function call
