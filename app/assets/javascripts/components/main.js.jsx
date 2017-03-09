var React = require('react');
var CountriesContainer = require('./countries/CountriesContainer.js.jsx').default;
var StatesContainer = require('./states/StatesContainer.js.jsx').default;

export default class Main extends React.Component {
    constructor(props) {
        super(props);
        this.state = {country: ''};
        this.changeCountry = this.changeCountry.bind(this);
    }

    changeCountry(newCountry) {
        this.setState({country: newCountry});
    }

    render() {
        return (
            <div>
                <CountriesContainer onChange={this.changeCountry} />
                <StatesContainer country={this.state.country} />
            </div>
        );
    }
}