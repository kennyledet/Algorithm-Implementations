// Note: Since Go already supports locking and synchronization
//       primitives in the standard library and the language,
//       there is no need to actually use this locking method.
//       It exists purely for educational purposes!
package dekker

type Lock struct {
	flag [2]bool
	turn int
}

func LockingExampleThread1(l *Lock) {
	// do something without needing the lock
	l.flag[0] = true
	for l.flag[1] {
		if l.turn != 0 {
			l.flag[0] = false
			for l.turn != 0 {
				// spin, wait for lock to be unlocked
			}
			l.flag[0] = true
		}
	}

	// critical section, lock acquired
	// ...

	l.turn = 1
	l.flag[0] = false

	// more code
}

func LockingExampleThread2(l *Lock) {
	// do something without needing the lock
	l.flag[1] = true
	for l.flag[0] {
		if l.turn != 1 {
			l.flag[1] = false
			for l.turn != 1 {
				// spin, wait for lock to be unlocked
			}
			l.flag[1] = true
		}
	}

	// critical section, lock acquired
	// ...

	l.turn = 0
	l.flag[1] = false

	// more code
}

func RunExample() {
	// Start 2 function executions in parallel/concurrently
	l := new(Lock)
	go LockingExampleThread1(l)
	go LockingExampleThread2(l)
}
