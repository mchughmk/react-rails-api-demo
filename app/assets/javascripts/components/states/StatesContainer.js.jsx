var React = require('react');
var States = require('./States.js.jsx').default;

export default class StatesContainer extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            states: []
        };

        this.getStatesFromApiAsync = this.getStatesFromApiAsync.bind(this);
    }

    getStatesFromApiAsync(country) {
        if (country === '') {
            return new Promise((resolve, reject) => resolve([]));
        }
        return fetch('http://localhost:3000/api/countries/' + country + '/states/')
            .then((response) => response.json())
            .catch((error) => {
                console.error(error);
            });
    }

    shouldComponentUpdate(nextProps, nextState) {
        if (this.state.states === nextState.states) {
            return false;
        } else {
            return true;
        }
    }

    componentWillReceiveProps(nextProps) {
        if (this.props.country !== nextProps.country) {
            this.getStatesFromApiAsync(nextProps.country)
                .then((responseJson) => {
                    this.setState({states: responseJson});
                });
        }
    }

    render() {
        return <States states={this.state.states} />;
    }
}
