import React from "react";

export class ChargingStationInfo extends React.Component {
  constructor() {
    super();
    this.state = {
      charging_stations: []
    };
  }

  componentDidMount(){
    fetch("/api/v1/charging_stations")
        .then(resp => resp.json())
        .then(m => {
          this.setState({
            charging_stations: m
          })
        })
        .catch(error => console.log(error))
  }

  render() {
    return (
        <div>
          {this.state.charging_stations.map(station =>
              <p key={station.id}>{station.name}</p>
          )}
        </div>
    )
  }
}

export default ChargingStationInfo
