TheasParams provide a way to store data that is persisted in the current session.

Data stored in TheasParams is available and synchronized across the DOM, Javascript, and SQL.

The value stored in the TheasParam will be persisted as long as the User session is active.  Once the session ends (due to inactivity timeout or server restart), the value of the TheasParam will be cleared.

The value stored in the TheasParam can be set via HTML, Javascript,  and SQL.