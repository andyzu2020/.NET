Thread.ThreadState

Aborted	
The thread state includes AbortRequested and the thread is now dead, but its state has not yet changed to Stopped.
AbortRequested	
The Thread.Abort method has been invoked on the thread, but the thread has not yet received the pending System.Threading.ThreadAbortException that will attempt to terminate it.
Background	
The thread is being executed as a background thread, as opposed to a foreground thread. This state is controlled by setting the Thread.IsBackground property.
Running	
The thread has been started, it is not blocked, and there is no pending ThreadAbortException.
Stopped	
The thread has stopped.
StopRequested	
The thread is being requested to stop. This is for internal use only.
Suspended	
The thread has been suspended.
SuspendRequested	
The thread is being requested to suspend.
Unstarted	
The Thread.Start method has not been invoked on the thread.
WaitSleepJoin	
The thread is blocked. This could be the result of calling Thread.Sleep or Thread.Join, of requesting a lock — for example, by calling Monitor.Enter or Monitor.Wait — or of waiting on a thread synchronization object such as ManualResetEvent.