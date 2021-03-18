const Scheme = require('./scheme-model')

const checkSchemeId = async (req, res, next) => {
  try {
    const id = await Scheme.findById(req.params.scheme_id)
    if (!id) {
      res.status(404).json({
        message: `scheme with scheme_id ${req.params.scheme_id} not found`,
      })
    } else {
      next()
    }
  } catch (err) {
    res.status(500).json({ message: err })
  }
}

const validateScheme = async (req, res, next) => {
  const { scheme_name } = req.body
  try {
    if (!scheme_name || typeof scheme_name !== 'string') {
      res.status(400).json({ message: 'invalid scheme_name' })
    } else {
      next()
    }
  } catch (err) {
    res.status(500).json({ message: err })
  }
}

const validateStep = (req, res, next) => {
  const { instructions, step_number } = req.params
  try {
    if (
      !instructions ||
      typeof instructions !== 'string' ||
      typeof step_number !== 'number' ||
      step_number < 1
    ) {
      res.status(400).json({ message: 'invalid step' })
    } else {
      next()
    }
  } catch (err) {
    res.status(400).json({ message: err })
  }
}

module.exports = {
  checkSchemeId,
  validateScheme,
  validateStep,
}
