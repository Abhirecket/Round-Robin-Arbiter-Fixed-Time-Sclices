#  Round Robin Arbiter(Fixed Time Sclices)
 Accessing a Memory location by multiple Processor. Arbiter takes four input requests and outputs a grant(ONE HOT ENCODED) signal.

### RTL Description: Round Robin Arbiter with Fixed Time Slice

- **Module Name**: top
- **Inputs**:
  - `clk`: Clock input.
  - `rst_n`: Active low reset input.
  - `REQ[3:0]`: Request inputs from different sources.
- **Outputs**:
  - `GNT[3:0]`: Grant outputs to different sources.
- **Registers**:
  - `present_state`: Three-bit register storing the current state of the arbiter.
  - `next_state`: Three-bit register storing the next state of the arbiter.
- **Parameters**:
  - `IDLE`: State representing the idle state (3'b000).
  - `S0`, `S1`, `S2`, `S3`: States representing the different states of the arbiter.
- **Description**:
  - The `top` module implements a round-robin arbiter with a fixed time slice.
  - It uses a two always blocks: one for state transition and one for output assignment.
  - The state transition always block updates the `present_state` based on the current state and input requests.
  - The output assignment always block determines the grant signals `GNT` based on the current state.
  - Each state represents a different source to which the grant is given in a round-robin manner.
- **Behavior**:
  - When a request (`REQ`) is received from any source, the arbiter grants access to the corresponding source based on the current state.
  - The arbiter cycles through the sources in a round-robin fashion, ensuring fairness in granting access.
  - If no request is active (`REQ` is all zeros), the arbiter remains in the idle state.
- **Additional Comments**:
  - This module is commonly used in systems where multiple sources compete for access to a shared resource, ensuring fair access to all sources over time.
