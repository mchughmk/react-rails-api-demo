var React = require('react');
var Countries = require('./Countries.js.jsx').default;

export default class CountriesContainer extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            countries: []
        };
        this.handleChange = this.handleChange.bind(this);
        this.getCountriesFromApiAsync = this.getCountriesFromApiAsync.bind(this);
    }

    getCountriesFromApiAsync() {
        return fetch('http://localhost:3000/api/countries/')
            .then((response) => response.json())
            .then((responseJson) => {
                this.setState({countries: responseJson});
            })
            .catch((error) => {
                console.error(error);
            });
    }

    handleChange(e) {
        var newCountry = e.target.value;
        this.props.onChange(newCountry);
    }

    componentDidMount(nextProps, nextState) {
        this.getCountriesFromApiAsync();
    }

    render() {
        return <Countries onChange={this.handleChange} countries={this.state.countries} />;
    }
}